# download Alpine docker image (alpine operating system WITHOUT any kernel BECAUSE containers use the kernel of the HOST machine)
# that is binaries, libraries, etc...
FROM alpine
# install PHP inside the container (similar to "apt install php")
RUN apk add php
# Create folder app
WORKDIR /app
# Copy the src code into the container
COPY indx.php /app
# run the following command inside the container:
# php -f index.php -S 0.0.0.0:8080
# Run the command
ENTRYPOINT ["php"]
# Pass the arguemnts to the above command
CMD ["-f", "index.php", "-S", "0.0.0.0:8080"]
# Putting parenthesis will tell kernel to do the above instead of a shell
# no brackets is equivalent to sh -c "php -f index.php -S 0.0.0.0:8080" -> PID 1=sh
# with brackets its equivalent to php -f index.php -S 0.0.0.0:8080 -> PID 1= php
# expose port 8080 inside the container
EXPOSE 8080
