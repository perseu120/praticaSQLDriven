CREATE TABLE "public.usuarios" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL UNIQUE,
	"senha" varchar(255) NOT NULL,
	CONSTRAINT "usuarios_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produtos" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"preco" DECIMAL(50) NOT NULL DEFAULT '0',
	"categoria" varchar(50) NOT NULL,
	"tamanho" varchar(2) NOT NULL,
	"idImagePrincipal" integer NOT NULL,
	"idImage" integer,
	CONSTRAINT "produtos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.imagens" (
	"id" serial NOT NULL,
	"imagemUrl" TEXT NOT NULL,
	CONSTRAINT "imagens_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.vendas" (
	"id" serial NOT NULL,
	"quantidade" FLOAT NOT NULL DEFAULT '0',
	"situacao" integer NOT NULL DEFAULT '0',
	"dataCompra" DATE NOT NULL DEFAULT 'new date()',
	"enderecoEntrega" TEXT NOT NULL,
	"idUsuario" integer NOT NULL,
	"idProduto" integer NOT NULL,
	CONSTRAINT "vendas_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk0" FOREIGN KEY ("idImagePrincipal") REFERENCES "imagens"("id");
ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk1" FOREIGN KEY ("idImage") REFERENCES "imagens"("id");


ALTER TABLE "vendas" ADD CONSTRAINT "vendas_fk0" FOREIGN KEY ("idUsuario") REFERENCES "usuarios"("id");
ALTER TABLE "vendas" ADD CONSTRAINT "vendas_fk1" FOREIGN KEY ("idProduto") REFERENCES "produtos"("id");





