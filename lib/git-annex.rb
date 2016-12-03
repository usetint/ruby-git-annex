require 'git'

module Git
	# Monkeypatch for Ruby/Git
	class Base
		def annex?
			is_branch?("git-annex")
		end

		def annex
			Annex.new(AnnexLib.new(self, @logger))
		end
	end

	class Annex
		def initialize(lib)
			@lib = lib
		end

		def method_missing(cmd, *opts)
			opts = opts.flatten(1)

			if opts.last.is_a?(Hash)
				switches_with_args = opts.pop.flat_map do |k, v|
					["-#{"-" if k.to_s.length > 1}#{k}", v]
				end
				opts = switches_with_args + opts
			end

			@lib.annex(cmd, opts)
		end

		def respond_to_missing?(*)
			true
		end
	end

	class AnnexLib < Git::Lib
		def annex(cmd, opts = [])
			command("annex #{cmd}", opts)
		end
	end
end
