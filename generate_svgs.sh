#!/bin/sh
export PATH=$HOME/.local/bin:$PATH
D2_CMD=d2

which $D2_CMD > /dev/null 2>&1
RESULT=$?
if [ "$RESULT" -eq "0" ]; then
    echo "Found d2"
else
    # Install d2 
    curl -fsSL https://d2lang.com/install.sh | sh -s --
fi


d2 --sketch --layout=dagre d2_images/console_overview.d2 
if [ -d src/console_overview/ ]; then
  rm -r src/console_overview/
fi
mv d2_images/console_overview/ src/ 
cp d2_images/*.png src/console_overview/Atari2600/
cp d2_images/*.atari src/console_overview/Atari2600/
cp d2_images/*.nfo src/console_overview/Atari2600/

mdbook build
