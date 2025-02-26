CLASS zcl_data_loader DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   CONSTANTS: c_max_records TYPE i VALUE 10.
    METHODS: insert_locations IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      insert_employees IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      insert_equipments IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      insert_assignments IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      insert_maintenances IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      generate_random_date RETURNING VALUE(rv_date) TYPE d,
      ejecutar IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      clear_tables IMPORTING out TYPE REF TO if_oo_adt_classrun_out .
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_data_loader IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    ejecutar( out ).



  ENDMETHOD.



  METHOD    ejecutar.
    out->write('Ejecutando metodos..').
    clear_tables( out ).
    insert_locations( out ).
    insert_employees( out ).
    insert_equipments( out ).
    insert_assignments( out ).
    insert_maintenances( out ).
    out->write(' Carga de datos completada con éxito.').

  ENDMETHOD.

  METHOD   clear_tables.

    DELETE FROM zmaintenance_gp.
    DELETE FROM zassignment_gp.
    DELETE FROM zequipment_gp.
    DELETE FROM zemployeee_gp.
    DELETE FROM zlocation_gp.
    out->write('Tablas borradas' ).
  ENDMETHOD.

  METHOD insert_locations.
    DATA: itab_locations TYPE TABLE OF zlocation_gp,  " Tabla interna para almacenar ubicaciones
          wa_location    TYPE zlocation_gp,          " Work Area para construir cada registro
          lv_index       TYPE i,
          lv_location_id TYPE string.

    DO 5 TIMES.  " Generamos 5 ubicaciones dinámicamente
      lv_index = sy-index.

      " Rellenamos manualmente con ceros para formato ALPHA (ej. 'LOC001', 'LOC002')
      lv_location_id = |LOC{ lv_index WIDTH = 3 PAD = '0' }|.

      wa_location-location_id   = lv_location_id.
      wa_location-location_name = |Ubicación { lv_index }|.
      wa_location-address       = |Dirección { lv_index }|.

      APPEND wa_location TO itab_locations.
    ENDDO.

    " Insertamos todas las ubicaciones en la tabla zlocation_gp
    INSERT zlocation_gp FROM TABLE @itab_locations.

    out->write('Carga exitosa location' ).
  ENDMETHOD.

  METHOD insert_employees.
    DATA: itab_employees TYPE TABLE OF zemployeee_gp,
          wa_employee    TYPE zemployeee_gp,
          lv_index       TYPE i.

    DO 5 TIMES.
      lv_index = sy-index.

      wa_employee-employee_id = |EMP{ lv_index WIDTH = 3 PAD = '0' }|.
      wa_employee-first_name  = |Empleado { lv_index }|.
      wa_employee-last_name   = |Apellido { lv_index }|.
      wa_employee-department  = |DPT{ ( lv_index MOD 5 ) + 1 WIDTH = 3 PAD = '0' }|.

      APPEND wa_employee TO itab_employees.
    ENDDO.

    INSERT zemployeee_gp FROM TABLE @itab_employees.

    out->write('Carga exitosa empleados' ).
  ENDMETHOD.


  METHOD insert_equipments.
    DATA: itab_equipments TYPE TABLE OF zequipment_gp,
          wa_equipment    TYPE zequipment_gp,
          lv_index        TYPE i.

    DO 5 TIMES.
      lv_index = sy-index.

      wa_equipment-equipment_id     = |EQP{ lv_index WIDTH = 3 PAD = '0' }|.
      wa_equipment-description      = |Equipo { lv_index }|.
      wa_equipment-equipmenttype    = 'GENERAL'.
      wa_equipment-status           = 'ACT'.
      wa_equipment-location_id      = |LOC{ ( lv_index MOD 5 ) + 1 WIDTH = 3 PAD = '0' }|.
      wa_equipment-lastmaintenancedate = generate_random_date( ).

      APPEND wa_equipment TO itab_equipments.
    ENDDO.

    INSERT zequipment_gp FROM TABLE @itab_equipments.

    out->write('Carga exitosa equipos' ).
  ENDMETHOD.


  METHOD insert_assignments.
    DATA: itab_assignments TYPE TABLE OF zassignment_gp,
          wa_assignment    TYPE zassignment_gp,
          lv_index         TYPE i.

    DO 5 TIMES.
      lv_index = sy-index.

      wa_assignment-assignment_id  = |ASG{ lv_index WIDTH = 3 PAD = '0' }|.
      wa_assignment-equipment_id   = |EQP{ lv_index WIDTH = 3 PAD = '0' }|.
      wa_assignment-employee_id    = |EMP{ lv_index WIDTH = 3 PAD = '0' }|.
      wa_assignment-assignment_date = generate_random_date( ).

      APPEND wa_assignment TO itab_assignments.
    ENDDO.

    INSERT zassignment_gp FROM TABLE @itab_assignments.

    out->write('Carga exitosa asignaciones' ).
  ENDMETHOD.


  METHOD insert_maintenances.
    DATA: itab_maintenances TYPE TABLE OF zmaintenance_gp,
          wa_maintenance    TYPE zmaintenance_gp,
          lv_index          TYPE i.

    DO 5 TIMES.
      lv_index = sy-index.

      wa_maintenance-maintenance_id  = |MTN{ lv_index WIDTH = 3 PAD = '0' }|.
      wa_maintenance-equipment_id    = |EQP{ lv_index WIDTH = 3 PAD = '0' }|.
      wa_maintenance-maintenance_date = generate_random_date( ).
      wa_maintenance-description     = |Mantenimiento { lv_index }|.

      APPEND wa_maintenance TO itab_maintenances.
    ENDDO.

    INSERT zmaintenance_gp FROM TABLE @itab_maintenances.
    out->write('Carga exitosa mantenimientos' ).

  ENDMETHOD.


  METHOD generate_random_date.
    DATA: lv_days_offset TYPE i.
    lv_days_offset = ( sy-index * 3 ) MOD 365. " Rango de hasta un año
    rv_date = cl_abap_context_info=>get_system_date( ). " Reemplazo de SY-DATUM
  ENDMETHOD.

ENDCLASS.
