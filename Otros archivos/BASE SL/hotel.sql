CREATE OR REPLACE PROCEDURE LISTAR_USUARIO_ID(usuario2 IN VARCHAR2) 
IS
v_idUsuario USUARIO.ID_USER%type:= &ID_usuario;
BEGIN
  SELECT ID_USER into v_idUsuario FROM USUARIO WHERE USUARIO= usuario2;
END LISTAR_USUARIO_ID;


SELECT *
  FROM USUARIO 
  WHERE USUARIO='cliente';
  
  create or replace PROCEDURE MODIFICAR_CLIENTES(CAMPO IN VARCHAR2, DATO IN VARCHAR2,id_usuario IN VARCHAR2) 
IS  
BEGIN
    UPDATE CLIENTE SET CAMPO = DATO where ID_USER=id_usuario;
END MODIFICAR_CLIENTES;
  
  execute LISTAR_USUARIO_ID('colab') 
  
