#!/usr/bin/env python3

login="EMAIL EPITECH"
path_exam="PATH DOSSIER EXAM"


import ftplib
import getpass
import sys
import subprocess
import os

if __name__ == '__main__':
	print('Welcome.')
	passwd = getpass.getpass().replace('=', ' ')

	ftp = ftplib.FTP('exam.epitech.eu')
	try:
		ftp.login(user=login, passwd=passwd)
	except ftplib.all_errors:
		print('Error while upload')
		print('Bad password ?')
		sys.exit(1)

	os.chdir(path_exam)
	subprocess.call('tar -czf /tmp/rendu.tgz rendu end', shell=True)

	try:
		ftp.storbinary('STOR rendu.tgz', open('/tmp/rendu.tgz', 'rb'))
	except ftplib.all_errors:
		print('Error while pushing tarball')
		sys.exit(1)

	print('Rendu OK')
	sys.exit(0)
