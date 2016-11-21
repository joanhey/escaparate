	CREATE TABLE web (
	    id bigint not null PRIMARY key AUTO_INCREMENT,
	    url varchar(1000) not null,
	    destacada tinyint,
	    autor_id bigint not null,
	    pais varchar(100) not null,
	    descripcion tinytext,
	    creado_at timestamp,
	    actualizado_in timestamp
    )

    CREATE TABLE autor (
	    id bigint not null PRIMARY KEY AUTO_INCREMENT,
	    nombre varchar(1000) not null,
	    pais varchar(100) not null,
	    creado_at timestamp,
	    actualizado_in timestamp
    )

    CREATE TABLE tags (
		id bigint not null PRIMARY KEY AUTO_INCREMENT,
		nombre varchar(200) NOT NULL,
		creado_at timestamp
	)

    CREATE TABLE tagged (
    	id bigint not null PRIMARY KEY AUTO_INCREMENT,
    	tags_id bigint not null,
    	web_id bigint not null,
    	tagged_at timestamp
    )

    create table social (
    	id bigint not null PRIMARY KEY AUTO_INCREMENT,
		nombre varchar(200) NOT NULL,
		creado_at timestamp 
    )

    create table autor_social (
    	id bigint not null PRIMARY KEY AUTO_INCREMENT,
		social_id bigint not null,
		autor_id bigint not null,
		cuenta varchar(1000) not null,
		creado_at timestamp 
    )

    alter table web add constraint fk_autor_a_web foreign key (autor_id)
    references autor (id);

    alter table tagged add constraint fk_tag_a_tagged foreign key (tags_id)
    references tags (id);

    alter table tagged add constraint fk_web_a_tagged foreign key (web_id)
    references web (id);

    alter table autor_social add constraint fk_autor_a_autor_social foreign key (autor_id)
    references autor (id);

    alter table autor_social add constraint fk_social_a_autor_social foreign key (social_id)
    references social (id);
