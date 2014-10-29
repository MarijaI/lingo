# encoding: utf-8

require 'rake/clean'
require 'nuggets/ruby'

require_relative 'lib/lingo/version'

begin
  require 'hen'

  Hen.lay! {{
    gem: {
      name:         'lingo',
      version:      Lingo::VERSION,
      summary:      'The full-featured automatic indexing system',
      authors:      ['John Vorhauer', 'Jens Wille'],
      email:        ['lingo@vorhauer.de', 'jens.wille@gmail.com'],
      license:      'AGPL-3.0',
      homepage:     'http://lex-lingo.de',

      description:  <<-EOT,
Lingo is an open source indexing system for research and teachings.
The main functions of Lingo are:

* identification of (i.e. reduction to) basic word form by means of
  dictionaries and suffix lists
* algorithmic decomposition
* dictionary-based synonymisation and identification of phrases
* generic identification of phrases/word sequences based on patterns
  of word classes
      EOT

      extra_files:  FileList[
        'lib/lingo/{srv,web}/**/{,.}*',
        'config/*.cfg',
        'dict/*/*.txt',
        'lang/*.lang',
        'txt/*.txt'
      ].to_a,

      dependencies: {
        'cyclops'       => ['~> 0.0', '>= 0.0.4'],
        'nuggets'       => '~> 1.0',
        'rubyzip'       => '~> 1.1',
        'sinatra-bells' => '~> 0.0',
        'unicode'       => '~> 0.4'
      },

      development_dependencies: {
        'diff-lcs' => '~> 1.2',
        'open4'    => '~> 1.3'
      },

      required_ruby_version: '>= 1.9.3'
    },
    test: {
      pattern: %w[test/ts_*.rb test/attendee/ts_*.rb]
    }
  }}
rescue LoadError => err
  warn "Please install the `hen' gem. (#{err})"
end

CLEAN.include(
  'txt/*.{log,mul,non,seq,ste,syn,ve?}',
  'test/{test.*,text.non}',
  'store/*/*.rev',
  'bench/tmp.*'
)

CLOBBER.include('store')

desc 'Run ALL tests'
task 'test:all' => %w[test test:txt test:lir]

desc 'Test against reference file (TXT)'
task('test:txt') { test_ref('artikel', 'lingo') }

desc 'Test against reference file (LIR)'
task('test:lir') { test_ref('lir') }

unless (benchmarks = Dir[File.expand_path('../bench/*_bench.rb', __FILE__)]).empty?
  desc 'Run all benchmarks'
  task :bench

  benchmarks.each { |benchmark|
    bench = File.basename(benchmark, '_bench.rb')
    task bench: benchtask = "bench:#{bench}"

    desc "Run #{bench} benchmark"
    task(benchtask) { system(File.ruby, benchmark) }
  }
end

def test_ref(name, cfg = name)
  require 'diff/lcs'
  require 'diff/lcs/ldiff'

  cmd = %W[bin/lingo -c #{cfg} txt/#{name}.txt]
  diff, msg = 0, ["Command failed: #{cmd.join(' ')}"]

  Process.ruby(*cmd, I: :lib) { |_, _, o, e|
    IO.interact({}, { o => msg, e => msg })
  }.success? or abort msg.join("\n\n")

  Dir["test/ref/#{name}.*"].sort.each { |ref|
    diff += if File.exist?(org = ref.sub(/test\/ref/, 'txt'))
      puts "## #{org}"
      Diff::LCS::Ldiff.run(ARGV.clear << '-a' << org << ref)
    else
      puts "?? #{org}"
      1
    end
  }

  exit diff + 1 unless diff.zero?
end
