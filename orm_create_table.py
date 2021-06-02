#__author__:"jcm"
from sqlalchemy import create_engine,String,Integer,DATE,Column,Table,ForeignKey

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.orm import relationship
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

teacher_m2m_class = Table('teacher_m2m_class',Base.metadata,
                          Column('teacher_id',ForeignKey('teachers.teacher_id')),
                          Column('class_id',ForeignKey('classes.class_id'))
                          )
class_m2m_student = Table('class_m2m_student',Base.metadata,
                          Column('class_id',ForeignKey('classes.class_id')),
                          Column('student_id',ForeignKey('students.stu_id'))
                          )

class Class_m2m_schedule(Base):
    __tablename__ = 'class_m2m_schedule'
    id = Column(Integer,primary_key=True)
    class_id = Column(ForeignKey("classes.class_id"))
    schedule_id = Column(ForeignKey("schedules.sche_id"))
    def __repr__(self):
        return 'class_id:%s  schedule_id:%s'%(self.class_id,self.schedule_id)

#老师表
class Teacher(Base):
    __tablename__ = 'teachers'
    teacher_id = Column(Integer,primary_key=True)
    teacher_name = Column(String(32),nullable=False)
    password = Column(String(64),nullable=False)
    classes = relationship('Class',secondary ='teacher_m2m_class',backref ='teachers')
    def __repr__(self):
        return "teacher:%s"%self.teacher_name
#课节表
class Schedule(Base):
    __tablename__ = 'schedules'
    sche_id = Column(Integer,primary_key=True)
    sche_name = Column(String(32),nullable=False)

#班级表
class Class(Base):
    __tablename__= 'classes'
    class_id = Column(Integer,primary_key=True)
    class_name = Column(String(32),nullable=False)
    course = Column(String(64),nullable=False)
    students = relationship('Student',secondary='class_m2m_student',backref='classes')
    schedules = relationship('Schedule',secondary = 'class_m2m_schedule',backref ='classes')

    def __repr__(self):
        return '<%s>'%self.class_name

#学生表
class Student(Base):
    __tablename__ = 'students'
    stu_id = Column(Integer,primary_key=True)
    stu_name = Column(String(32),nullable=False)
    QQ = Column(Integer,nullable=False)
    password = Column(String(32),nullable=False)

#上课记录表
class Study_record(Base):
    __tablename__ = 'study_records'
    id = Column(Integer,primary_key=True)
    class_m2m_schedule_id = Column(Integer,ForeignKey("class_m2m_schedule.id"))
    stu_id = Column(Integer,ForeignKey("students.stu_id"))
    status = Column(String(32),default='no')
    commit_status = Column(String(32),default='未提交')
    score = Column(Integer)
    class_m2m_schedule = relationship('Class_m2m_schedule',foreign_keys = [class_m2m_schedule_id],backref='study_records')
    student = relationship('Student',foreign_keys = [stu_id],backref='study_records')

engine= create_engine('mysql+pymysql://root:root@127.0.0.1/studentmanager?charset=utf8',encoding='utf-8')
Base.metadata.create_all(engine)
