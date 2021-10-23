using { school, sap.common } from '../db/data-model';


service AdminService  @(requires:'admin'){
   entity Students as projection on school.Students{
   	*,
   	enrollments: redirected to Enrollments,
   };
   entity Courses as projection on school.Courses;
   	
   entity Enrollments as projection on school.Enrollments{
   	 *,
        class: redirected to Classes,
        student: redirected to Students,
   };
   entity ClassRooms as projection on school.Classrooms;
   
   entity Classes as projection on school.Classes{
      *,
      course: redirected to Courses,
   };

   view StudentByCourses as SELECT  from school.Courses as courseStudent{
		key ID,
		name, 
      classes.enrollments.student.name as studentName
		
	};

}

