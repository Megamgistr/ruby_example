#!/bin/bash


if [-e /opt/app ]; then
	SEEDED_FILE=/opt/app/.alredy_seeded
	pushd /opt/app
	if [-e $SEEDED_FILE ]; then
		rake db:migrate || {echo "Can not migrate db"; exit 1;}
	else
		rake db:migrate || {echo "Can not migrate db"; exit 1;}
		rake db:seed || {echo "Can not seed db"; exit 1;}
		echo 1 > $SEEDED_FILE
	fi

	rake tmp:clear || {echo "Can clear cash";}
	popd
fi

rails server -p 3001 -b 0.0.0.0