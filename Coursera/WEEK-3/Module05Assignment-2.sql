-- 1.	Insert a new row into the Facility table with facility name “Swimming Pool”.

INSERT INTO Facility (FacNo, FacName) VALUES ('F104', 'Swimming Pool');

-- 2.	Insert a new row in the Location table related to the Facility row in modification 
-- problem 1. The new row should have “Door” for the location name.

INSERT INTO Location (LocNo, FacNo, LocName) VALUES ('L107', 'F104', 'Door');

-- 3.	Insert a new row in the Location table related to the Facility row in modification 
-- problem 1. The new row should have “Locker Room” for the location name.

INSERT INTO Location (LocNo, FacNo, LocName) VALUES ('L108', 'F104', 'Locker Room');

-- 4.	Change the location name of “Door” to “Gate” for the row inserted in modification 
-- problem 2.

UPDATE Location 
SET 
    LocName = 'Gate'
WHERE
    LocNo = 'L107';

-- 5.	Delete the row inserted in modification problem 3.

DELETE FROM Location 
WHERE
    LocNo = 'L108';