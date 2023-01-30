Select * from covidDeaths
where continent is not null
order by 3,4

-- Select Data that we are going to be using

select location, date, total_cases, new_cases, total_deaths, population
from covidDeaths
order by 1,2

--Looking at total Cases vs total Deaths

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathDifference
from covidDeaths
where location like '%India%'
order by 1,2


-- Looking at total cases vs Population
--percentage of population got infected

select location, date, total_cases, population, (total_cases/population)*100 as Infected
from covidDeaths
-- where location like '%India%'
order by 1,2


--Highest infection rate in country by population
select location, population, max(total_cases) as infectionCount, max((total_cases/population))*100 as INFECTIONpercent
from covidDeaths
-- where location like '%India%'
group by location, population
order by INFECTIONpercent desc


-- Highest death_count/population in country

select location, max(cast(total_deaths as int)) as deathCount
from covidDeaths
-- where location like '%India%'
where continent is not null
group by location, population
order by deathCount desc


-- Deathcount by continent

select continent, max(cast(total_deaths as int)) as deathCount
from covidDeaths
-- where location like '%India%'
where continent is not null
group by continent
order by deathCount desc


-- CovidVaccination
select * from covidVaccination

--Total Population vs Vaccination

select d.continent, d.location, d.date, d.population, v.new_vaccinations
from covidDeaths d
join covidVaccination v
on d.location = v.location
and d.date = v.date
where d.continent is not null
order by 2,3


