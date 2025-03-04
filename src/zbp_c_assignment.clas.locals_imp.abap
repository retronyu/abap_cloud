CLASS lhc_ASSIGNMENT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR assignment RESULT result.

    METHODS AsignarEquipoAEmpleado FOR MODIFY
      IMPORTING keys FOR ACTION assignment~AsignarEquipoAEmpleado RESULT result.

ENDCLASS.

CLASS lhc_ASSIGNMENT IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD AsignarEquipoAEmpleado.

  data: ls_equipment type ZEQUIPMENT_GP,
        lv_equipment_id TYPE ZEQUIPMENT_GP-equipment_id.

  CONSTANTS : BEGIN OF zstatus,
     MTN TYPE STRING  VALUE 'MTN',
     ACT TYPE STRING  VALUE 'ACT',
     INA TYPE STRING  VALUE 'INA',
     END OF zstatus.




   READ ENTITIES OF z_c_assignment IN LOCAL MODE
    ENTITY Assignment
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(assignment_data).

    LOOP AT assignment_data into data(ls_assignment_data).

      lv_equipment_id = ls_assignment_data-EquipmentId .

    ENDLOOP.


  if  lv_equipment_id is NOT INITIAL.
      SELECT SINGLE  *
      FROM ZEQUIPMENT_GP
      WHERE equipment_id = @lv_equipment_id
      into CORRESPONDING FIELDS OF @ls_equipment.

      IF ls_equipment-status = zstatus-mtn.
        RETURN. "" NO SE PUEDE ASIGNAR
      ELSEIF ls_equipment-status  = zstatus-ina.

         RETURN. "" NO SE PUEDE ASIGNAR
       ELSEIF ls_equipment-status  = zstatus-act.


      ENDIF.



  ENDIF.



  ENDMETHOD.

ENDCLASS.
