FROM lambci/lambda:build-ruby2.5
RUN yum install -y mysql mysql-devel
RUN gem update bundler
ADD client/Gemfile /var/task/Gemfile
ADD client/Gemfile.lock /var/task/Gemfile.lock
RUN bundle install --path /var/task/vendor/bundle --clean
