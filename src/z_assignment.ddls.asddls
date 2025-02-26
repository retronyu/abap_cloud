@AbapCatalog.sqlViewName: 'Z_ASSIGNMENT1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'abla de asignaciones'
@Metadata.ignorePropagatedAnnotations: true

define root view Z_Assignment as select from zassignment_gp
association [0..1] to zequipment_gp as _Equipment on _Equipment.equipment_id = zassignment_gp.equipment_id
association [0..1] to zemployeee_gp as _Employee on _Employee.employee_id = zassignment_gp.employee_id
{
    key assignment_id      as AssignmentId,

    _Equipment.equipment_id  as EquipmentId,  
    _Equipment.description   as EquipmentDescription, // Información del equipo
    
    _Employee.employee_id    as EmployeeId,
    _Employee.first_name     as EmployeeFirstName,
    _Employee.last_name      as EmployeeLastName, // Información del empleado
    
    assignment_date       as AssignmentDate,

    created_at            as CreatedAt,
    created_by            as CreatedBy
}
