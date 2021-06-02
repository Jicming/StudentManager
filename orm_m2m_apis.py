#__author__:"jcm"
import orm_create_table
from sqlalchemy.orm import sessionmaker

Session_class = sessionmaker(bind=orm_create_table.engine)
session = Session_class()
#

sche1 = orm_create_table.Schedule(sche_name='day1')
sche2 = orm_create_table.Schedule(sche_name='day2')
sche3 = orm_create_table.Schedule(sche_name='day3')
sche4 = orm_create_table.Schedule(sche_name='day4')


# class1 = orm_create_table.Class(class_name='S1',course='Python')
# class2 = orm_create_table.Class(class_name='S2',course='Java')
# class3 = orm_create_table.Class(class_name='S3',course='Go')
# class4 = orm_create_table.Class(class_name='S3',course='C#')
session.add_all([sche1,sche2,sche3,sche4])

teacher1 = orm_create_table.Teacher(teacher_name='Alex',password='12345')
teacher2 = orm_create_table.Teacher(teacher_name='Peiqi',password='12345')
teacher3 = orm_create_table.Teacher(teacher_name='Jack',password = '12345')
teacher4 = orm_create_table.Teacher(teacher_name='Mayun',password ='12345')
teacher5 = orm_create_table.Teacher(teacher_name='Wangjianlin',password='12345')
# teacher1.classes=[class1,class2,class3]
# teacher2.classes=[class1,class3,class4]
# teacher3.classes=[class1,class2]
# teacher4.classes=[class1,class4]
# teacher5.classes=[class2,class3]


stu1 = orm_create_table.Student(stu_name='wangpeng',QQ=1234563,password='12345')
stu2 = orm_create_table.Student(stu_name='buju',QQ=223456,password='12345')
stu3 = orm_create_table.Student(stu_name='zhangsan',QQ=41209832,password='12345')
stu4 = orm_create_table.Student(stu_name='lisi',QQ=251766460,password='12345')
stu5 = orm_create_table.Student(stu_name='wangwu',QQ=13081832,password='12345')

# c1 = orm_create_table.Class_m2m_schedule(classes=class1,schedules=sche1)
# c2 = orm_create_table.Class_m2m_schedule(classes=class2,schedules=sche1)
# c3 = orm_create_table.Class_m2m_schedule(classes=class3,schedules=sche1)
# c4 = orm_create_table.Class_m2m_schedule(classes=class4,schedules=sche3)

session.add_all([teacher1,teacher2,teacher3,teacher4,teacher5,stu1,stu2,stu3,stu4,stu5])




session.commit()