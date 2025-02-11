CLASS lhc_Z_C_EQUIPMENT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR z_c_equipment RESULT result.

    METHODS MarcarComoEnReparacion FOR MODIFY
      IMPORTING keys FOR ACTION z_c_equipment~MarcarComoEnReparacion RESULT result.
    METHODS newEquipment FOR MODIFY
      IMPORTING keys FOR ACTION Z_C_EQUIPMENT~newEquipment.




ENDCLASS.

CLASS lhc_Z_C_EQUIPMENT IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.



  METHOD MarcarComoEnReparacion.

    DATA: ls_reported TYPE Z_C_EQUIPMENT.

        " Leer solo el campo Status
      READ ENTITIES OF Z_C_EQUIPMENT IN LOCAL MODE
     ENTITY Z_C_EQUIPMENT
     FIELDS ( Status )
     WITH CORRESPONDING #( keys )
     RESULT DATA(lt_equipment)
     FAILED failed.

 MODIFY ENTITIES OF Z_C_EQUIPMENT IN LOCAL MODE
    ENTITY Z_C_EQUIPMENT
    UPDATE FIELDS ( Status )
    WITH VALUE #( FOR ls_equipment IN lt_equipment WHERE ( Status <> 'Activo' OR    Status <> 'Inactivo'  )
       ( Equipmentid = ls_equipment-Equipmentid Status = 'MNT_ACTIVO' ) )
    FAILED failed
    REPORTED   DATA(lt_reported)
    MAPPED DATA(mapped_update).




  ENDMETHOD.


  METHOD newEquipment.


  ENDMETHOD.

ENDCLASS.
