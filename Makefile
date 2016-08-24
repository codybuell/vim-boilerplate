default:
	@printf "usage: make [ \033[0;32mawesome\033[0m | \033[0;31mboring\033[0m ]\n\n\
	    \033[0;32mawesome\033[0m: place symlinks for vim-boilerplate configs in your home dir\n\
	    \033[0;31mboring\033[0m:  put the original vim configuration files back in place\n\n"

awesome:
	scripts/connect-the-dots.sh

boring:
	scripts/remove-the-dots.sh
