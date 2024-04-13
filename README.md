# API EARTHQUAKE


## Instalacion

```bash
$ bundle install
```
**Pasos para correr aplicacion**

## Running 

```bash
$ rails db:migrate
$ rails db:schema:load
$ rails s
```

## Task
**Correr task para obtener datos desd el sitio (earthquake.usgs.gov)**

```bash
$ rails earthquake:get_data
```


## Endpoints

**Obtener features**
```bash
  http://127.0.0.1:3000/api/features?page=1&per_page=2%27
```
**Obtener features filtrados por mag_type :Ejemplo md y ml** 
```bash
  http://127.0.0.1:3000/api/features?page=1&per_page=20&mag_type%5B%5D=md&mag_type%5B%5D=ml%27
```

**Agregar Comentario**
```bash
  http://127.0.0.1:3000/api/features/1/comments
```

# APLICACION WEB

**https://github.com/andres1315/app-earthquake**

* Ruby version  3.2.3

* Rails version 7.1.3.2
