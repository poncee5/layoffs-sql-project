-- exploratory data analysis (EDA) 

SELECT * 
FROM layoffs_staging2;

select max(total_laid_off),max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where total_laid_off =12000;

SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off=1;

SELECT *
from layoffs_staging2
where percentage_laid_off=1
order by funds_raised_millions desc;


select company , sum(total_laid_off) 
from layoffs_staging2
group by company 
order by 2 desc;

select *
from layoffs_staging2
where company='Amazon';

select country , sum(total_laid_off) 
from layoffs_staging2
group BY country
order by 2 desc ;

select year(`date`) , sum(total_laid_off) 
from layoffs_staging2
group BY year(`date`)
order by 2 desc ;

select substring(`date`,6,2) as Month , sum(total_laid_off)
from layoffs_staging2
where substring(`date`,6,2) is not null
group by Month
order by 1 asc;

with Rolling_Total as (
select substring(`date`,1,7) as Month , sum(total_laid_off) as `laidOff`
from layoffs_staging2
where substring(`date`,1,7) is not null
group by Month
order by 1 asc
) 
select `Month` ,laidOff, sum(`laidOff`) over(order by `Month`) as rolling_total 
from Rolling_Total;


select company , year(`date`) , sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by company asc ;


with company_year (company , years , total_laid_off) as (
select company , year(`date`) , sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`) 
)
select *, DENSE_RANK() over (PARTITION BY years order by total_laid_off desc) as  ranking
from company_year
where years is not null 
order by ranking asc;  