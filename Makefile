# Make file for common commands to run
build_prod:
	docker-compose -f docker-compose.prod.yml build

start_prod:
	docker-compose -f docker-compose.prod.yml up -d --build

collect_static:
	docker-compose -f docker-compose.prod.yml exec web python manage.py collectstatic --no-input --clear

migrate_prod:
	docker-compose -f docker-compose.prod.yml run web python manage.py migrate --noinput

create_super_user_prod:
	docker-compose -f docker-compose.prod.yml exec web python manage.py createsuperuser --noinput

stop_prod:
	docker-compose -f docker-compose.prod.yml down -v

check_logs:
	docker-compose -f docker-compose.prod.yml logs -f

dev_build:
	docker-compose -f docker-compose.yml build

dev_start:
	docker-compose -f docker-compose.yml up -d --build

dev_collect_static:
	docker-compose -f docker-compose.yml exec web python manage.py collectstatic --no-input --clear

dev_migrate:
	docker-compose -f docker-compose.yml run web python manage.py migrate --noinput

dev_create_super_user:
	docker-compose -f docker-compose.yml exec web python manage.py createsuperuser --noinput

dev_stop:
	docker-compose -f docker-compose.yml down -v

dev_check_logs:
	docker-compose -f docker-compose.yml logs -f

dev_restart:
	docker-compose -f docker-compose.yml restart

dev_tests:
	docker-compose -f docker-compose.yml exec web python manage.py test

dev_db_ssh:
	docker-compose -f docker-compose.yml exec db /bin/bash 