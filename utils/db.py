from sqlalchemy import Column, String, Integer, Float
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


Base = declarative_base()
engine = create_engine("sqlite:///rzhd.db")
session = sessionmaker(bind=engine)


class Users(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True)
    full_name = Column(String)
    email = Column(String)
    password = Column(String)


class CriticalParameters(Base):
    __tablename__ = "critical_parameters"
    id = Column(Integer, primary_key=True)
    acceleration = Column(Float)
    type = Column(String)


class Parameters(Base):
    __tablename__ = "parameters"
    id = Column(Integer, primary_key=True)
    longitude = Column(Float)
    latitude = Column(Float)
    acceleration = Column(Float)
    time = Column(String)


Base.metadata.create_all(bind=engine)
