FROM lambci/lambda:build-ruby2.5
# RUN gem install bundler
# COPY ./docker/api/docker-entrypoint.sh /
RUN mkdir /app
COPY ./api /app
WORKDIR /app
RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]