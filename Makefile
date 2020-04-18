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
