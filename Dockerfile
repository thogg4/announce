FROM ruby:2.1.2-onbuild

CMD ["bundle", "exec", "rackup -p 8080"]
