#!/bin/bash
su postgres -c 'pg_dump owncloud > pgdump.sql'
