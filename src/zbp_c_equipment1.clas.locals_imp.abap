CLASS lhc_Equipment DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Equipment RESULT result.
    METHODS marcarcomoenreparacion FOR MODIFY
      IMPORTING keys FOR ACTION equipment~marcarcomoenreparacion RESULT result.




    ""METHODS Validate_Location FOR VALIDATE ON SAVE
      ""IMPORTING keys FOR Equipment~Validate_Location.

ENDCLASS.

CLASS lhc_Equipment IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.



 "" METHOD Validate_Location.



  ""ENDMETHOD.



  METHOD marcarComoEnReparacion.

" Modificar en LOCAL MODE
  MODIFY ENTITIES OF z_c_equipment IN LOCAL MODE
    ENTITY Equipment
    UPDATE FIELDS ( Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = 'MNT' ) ).

  " Leer la entidad para actualizar la UI
  READ ENTITIES OF z_c_equipment IN LOCAL MODE
    ENTITY Equipment
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(equipment_data).

  " Devolver resultado
  result = VALUE #( FOR equipment IN equipment_data ( %tky = equipment-%tky %param = equipment ) ).


  ENDMETHOD.

ENDCLASS.
