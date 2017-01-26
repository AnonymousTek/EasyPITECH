#!/usr/bin/env python3

login="EMAIL EPITECH"
path_exam="PATH DOSSIER EXAM"

import ftplib
import sys
import subprocess

exam_server = '10.40.0.116'

if __name__ == '__main__':
        print('Welcome. \nEnter login:' + login)
	token = input('Enter token: ')
        
	try:
		f = open(path_exam + "/token", "r")
		oldtoken = f.readline()
		f.close()
	except:
		print('Can\'t open token file')
		sys.exit(1)

	ftp = ftplib.FTP(exam_server)
	try:
		ftp.login(user=login, passwd=token)
	except ftplib.all_errors:
		print('Error while login-in')
		print('It can be a bad token or it means that you are not subscribed')
		sys.exit(1)

	ftp.set_debuglevel(2)

	if token != oldtoken:
		try:
			f = open(path_exam + '/token', 'w')
			f.write(token)
			f.close()
		except:
			print("Can't write token file")
			sys.exit(1)

		print('Downloading subject')
		try:
			ftp.retrbinary('RETR subject.tar.gz', open('/tmp/subject.tar.gz', 'wb').write)
		except ftplib.all_errors:
			print('Unknown errors')
			sys.exit(1)

		print('Clean directories')
		try:
			subprocess.call('rm -rf' + path_exam + '/rendu/*', shell=True)
			subprocess.call('rm -rf' + path_exam + '/rendu/.*', shell=True)
			subprocess.call('rm -rf' + path_exam + '/sujet/*', shell=True)
			subprocess.call('rm -rf' + path_exam + '/sujet/.*', shell=True)
			subprocess.call('rm -rf' + path_exam + '/end/*', shell=True)
			subprocess.call('rm -rf' + path_exam + '/end/.*', shell=True)
		except:
			print('Something went wrong')
			sys.exit(1)

		print('Extracting subject')
		try:
			subprocess.call('tar -xzf /tmp/subject.tar.gz -C' + path_exam + '/sujet', shell=True)
		except:
			print('Something went wrong')
			sys.exit(1)

	sys.exit(0)
