# If "./bin/rails" is present run it, otherwise run "rails" with "bundle exec".

function bin_or_bundle_rails
  if test -e ./bin/rails
    ./bin/rails $argv
  else
    bundle exec rails $argv
  end
end
