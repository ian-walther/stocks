FROM phusion/passenger-ruby27:1.0.12

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y yarn

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

ENV RAILS_ENV production

ENV APP_HOME /stocks
RUN mkdir $APP_HOME
COPY Gemfile* $APP_HOME/
COPY .ruby-* $APP_HOME/

WORKDIR $APP_HOME

RUN /bin/bash -l -c 'cd . && bundle install'

COPY . $APP_HOME/

RUN /bin/bash -l -c 'cd . && bundle exec rake assets:precompile'

RUN chmod 777 -R .

ADD nginx/server.conf /etc/nginx/sites-enabled/stocks.conf
