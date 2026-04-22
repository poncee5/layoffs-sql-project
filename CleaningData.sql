-- DATA CLEANING 

SELECT * 
from layoffs ;

create table layoffs_staging 
like layoffs;

select *
from layoffs_staging;

insert layoffs_staging 
select *
from layoffs;

TRUNCATE TABLE layoffs_staging;

select *,
row_number() over (
partition by company ,location,industry,total_laid_off, percentage_laid_off,date,stage ,country,funds_raised_millions) as row_num
from layoffs_staging;

with temp_table AS (
select *,
row_number() over (
partition by company ,location,industry,total_laid_off, percentage_laid_off,date,stage ,country,funds_raised_millions) as row_num
from layoffs_staging )
select *
FROM temp_table
where row_num >1 ; 



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2
where row_num >1;

insert into layoffs_staging2
select *,
row_number() over (
partition by company ,location,industry,total_laid_off, percentage_laid_off,date,stage ,country,funds_raised_millions) as row_num
from layoffs_staging ;

delete 
from layoffs_staging2
where row_num>1;

select *
from layoffs_staging2;


-- standardizing data (finding issues in data and fixing them)


select trim(company) 
from layoffs_staging2;

UPDATE layoffs_staging2
set company = trim(company) ;

SELECT *
from layoffs_staging2;

select DISTINCT industry
from layoffs_staging2
order by 1 ;

select *
from layoffs_staging2
where industry like 'crypto%';

UPDATE layoffs_staging2
set industry = 'crypto'
where industry like 'crypto%';


select DISTINCT country 
FROM layoffs_staging2
order by 1;

update layoffs_staging2
set country = 'united states'
where country like 'united states%';

select *
from layoffs_staging2
where country = 'united states.';

select *
from layoffs_staging2;


select `date`,
str_to_date ( `date`, '%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date( `date`, '%m/%d/%Y');

select *
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date`  DATE;

-- nulls and blanks 

select *
FROM layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null ;


select *
from layoffs_staging2 
where industry is null 
or industry ='';

select * 
from layoffs_staging2
where company = 'Airbnb';

select t1.industry ,t2.industry 
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company= t2.company
where (t1.industry is null or t1.industry='')
and t2.industry is not null;


update layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null )
and t2.industry is not null  ; 

UPDATE layoffs_staging2
set industry = null
where industry ='';

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;


select *
from layoffs_staging2;

alter table layoffs_staging2
drop COLUMN row_num;





