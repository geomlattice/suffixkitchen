FROM elixir:1.18.4-otp-27-alpine

#TODO: load dev code into container
#RUN apk update && apk upgrade && apk add git curl wget vim sqlite sqlite-libs
#WORKDIR /var/www/suffix
#ADD suffix/ /var/www/suffix 
#RUN mix deps.get
#CMD ["mix", "phx.server"]
#CMD ["ping", "www.codeberg.org"]

##########################################################

###init new pheonix app

RUN apk update && apk upgrade && apk add git curl wget vim sqlite sqlite-libs inotify-tools
WORKDIR /var/www/
##RUN mix archive.install hex phx_new && mix phx.new suffix --database sqlite3 --no-install && mix deps.get && mix assets.setup && mix deps.compile
RUN mix archive.install hex phx_new --force 
RUN mix phx.new suffix --database sqlite3 --no-install 
WORKDIR /var/www/suffix
RUN mix deps.get && mix assets.setup && mix deps.compile && mix ecto.create
##RUN sed -i 's/url: [host: "localhost"],/#url: [host: "localhost"],\nhttp: [ip: {0, 0, 0, 0}, port: 4000],\n/g' config/config.exs
##RUN sed -i 's/http: [ip: {127, 0, 0, 1/http: [ip: {0, 0, 0, 0/g' config/dev.exs
RUN sed -i 's/127, 0, 0, 1/0, 0, 0, 0/g' config/dev.exs

##CMD ["ping", "www.codeberg.org"]
CMD ["mix", "phx.server"]

#####################################################

###move src from host to container

#RUN apk update && apk upgrade && apk add git curl wget vim sqlite sqlite-libs inotify-tools
#WORKDIR /var/www/suffix
##RUN mix archive.install hex phx_new && mix phx.new suffix --database sqlite3 --no-install && mix deps.get && mix assets.setup && mix deps.compile
#RUN mix archive.install hex 
##RUN mix deps.get && mix assets.setup && mix deps.compile && mix ecto.create

#CMD ["ping", "www.codeberg.org"]
##CMD ["mix", "phx.server"]
