CREATE DATABASE AmanTaxiDB;
GO

USE AmanTaxiDB;
GO

CREATE TABLE Rides (
    RideId INT IDENTITY(1,1) PRIMARY KEY,
    ChildName NVARCHAR(100) NOT NULL,
    PickupLocation NVARCHAR(200) NOT NULL,
    DropoffLocation NVARCHAR(200) NOT NULL,
    PickupTime NVARCHAR(20) NOT NULL,
    Status NVARCHAR(50) NOT NULL
);

INSERT INTO Rides (ChildName, PickupLocation, DropoffLocation, PickupTime, Status)
VALUES 
(N'Sara', N'Home', N'School', N'07:30', N'Requested'),
(N'Omar', N'School', N'Home', N'14:00', N'Accepted');
