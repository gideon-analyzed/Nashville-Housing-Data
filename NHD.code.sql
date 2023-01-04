/* aya lezz gooo */

SELECT * 
FROM nhd.`nashville housing data for data cleaning`;

 /* add column Initial Place as date*/
 
ALTER TABLE nhd.`nashville housing data for data cleaning;
ADD Initial_Place date

/* add column Initial Places as text*/

ALTER TABLE nhd.`nashville housing data for data cleaning`
ADD Initial_Places text

/* delete both columns added */

ALTER TABLE nhd.`nashville housing data for data cleaning`
DROP Initial_Place

ALTER TABLE nhd.`nashville housing data for data cleaning`
DROP Initial_Places

/* rename SaleDate column to SalesDate*/

ALTER TABLE nhd.`nashville housing data for data cleaning`
CHANGE SaleDate SalesDate text

/* PROPERTY ADDRESS*/

/* identify the empty fields */

SELECT OwnerName, PropertyAddress
FROM nhd.`nashville housing data for data cleaning`
WHERE PropertyAddress = ''

/* perform a self join to identify empty fields*/

SELECT x.UniqueID, x.ParcelID, x.PropertyAddress, y.ParcelID, y.PropertyAddress
FROM nhd.`nashville housing data for data cleaning` x
JOIN nhd.`nashville housing data for data cleaning` y
ON x.ParcelID = y.ParcelID
AND X.UniqueID != y.UniqueID
WHERE x.PropertyAddress = ''

/*disable safe mode*/

SELECT /*+ SQL_SAFE_UPDATES */ * 
FROM `nhd`.`nashville housing data for data cleaning`;

/* permanently replace the empty fields of PropertyAddress with null and rename the column to FinalPropertyAddress */

SELECT * , NULLIF(PropertyAddress, '') AS FinalPropertyAddress 
FROM nhd.`nashville housing data for data cleaning`;

COMMIT;

/* delete property address table */

ALTER TABLE nhd.`nashville housing data for data cleaning`
DROP PropertyAddress