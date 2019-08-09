SETLOCAL

REM #############################################################
REM # emacs
REM #############################################################
mkdir "%HOME%\.emacs.d"
touch %HOME%\.emacs.d\custom.el

mklink /d "%HOME%\.emacs.d\bin" "%HOME%\dotfiles\emacs\bin" 
mklink "%HOME%\.emacs.d\init.el" "%HOME%\dotfiles\emacs\init.el" 
mklink "%HOME%\.emacs.d\init-packages.org" "%HOME%\dotfiles\emacs\init-packages.org" 

