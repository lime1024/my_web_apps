# config/puma/production.rb
environment "production"

# UNIX Socketへのバインド
bind "unix://tmp/sockets/puma.sock"
