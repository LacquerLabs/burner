FROM nginx:alpine

# install php7-fpm and a db extension
RUN apk --update --no-cache add php7-fpm php7-json && \
	mv /etc/profile.d/color_prompt /etc/profile.d/color_prompt.sh && \
	echo alias dir=\'ls -alh --color\' >> /etc/profile && \
	mkdir -p /app

# copy our config files over to the container
COPY ./configs/php-fpm.conf /etc/php7/php-fpm.conf
COPY ./configs/default.conf /etc/nginx/conf.d/default.conf

# setup our working directory and copy over our codebase
WORKDIR /app
COPY ./code .

# expose our service port
EXPOSE 8080

# what we use to start the container
CMD php-fpm7 --daemonize -R && nginx -g "daemon off;"


