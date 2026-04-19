Select * 
from PortfolioProject..CovidDeaths_Clean 
where continent is not null
order by 3,4

--Select *
--from PortfolioProject..CovidVaccinations_Clean 
--order by 3,4

--Select data that we are going to use
Select location, date, total_cases, new_cases, total_deaths, population 
from PortfolioProject..CovidDeaths_Clean
where continent is not null
order by 1,2;

--Looking at total cases vs total deaths
--Shows likelihood of dying if you contact covid in your country

Select location, date, total_cases, total_deaths, Round((total_deaths*1.0/Nullif(total_cases,0))*100,2) as DeathPercentage
from PortfolioProject..CovidDeaths_Clean
where location ='india' and continent is not null
order by 1,2;

--Looking at total cases vs population
--Shows what percentage of population got covid

SELECT location,date, population,total_cases, ROUND((total_cases * 1.0 / population) * 100, 2) AS InfectionPercentage
FROM PortfolioProject..CovidDeaths_Clean
where continent is not null
--WHERE location = 'india'
ORDER BY 1,2;

--Looking at countries with highest infection rate compared to population
SELECT location, population,Max(total_cases) as HighestInfectRate, ROUND((Max(total_cases) * 1.0 / population) * 100, 2) AS InfectionPercentage
FROM PortfolioProject..CovidDeaths_Clean
where continent is not null
group by location, population
ORDER BY InfectionPercentage desc;

--Showing countries with highest death count per population

SELECT location, Max(total_deaths) as TotalDeathCount
FROM PortfolioProject..CovidDeaths_Clean
where continent is not null
group by location
ORDER BY TotalDeathCount desc;

--Breaking things by continent
--Showing continents with the highest death count per population

SELECT continent, Max(total_deaths) as TotalDeathCount
FROM PortfolioProject..CovidDeaths_Clean
where continent is not null
group by continent
ORDER BY TotalDeathCount desc;

--GLOBAL NUMBERS
Select Sum(new_cases) as total_cases, Sum(new_deaths) as total_deaths, sum(new_deaths)/sum(new_cases)*100 as deathpercentage
from PortfolioProject..CovidDeaths_Clean
--where location ='india' and 
where continent is not null
--group by date
order by 1,2;

--Looking at total population vs vaccinations
With PopsVac(continent,location,date,population,new_vaccinations,RollingPeopleVaccinated) as (
Select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
sum(vac.new_vaccinations) Over (Partition by dea.location order by dea.date)
as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths_Clean dea
join PortfolioProject..CovidVaccinations_Clean vac
on dea.location = vac.location
and dea.date=vac.date
where dea.continent is not null
)

Select *, (RollingPeopleVaccinated/population)*100
from PopsVac;

Drop table if exists #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date date,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
);

Insert into #PercentPopulationVaccinated
Select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
sum(vac.new_vaccinations) Over (Partition by dea.location order by dea.date)
as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths_Clean dea
join PortfolioProject..CovidVaccinations_Clean vac
on dea.location = vac.location
and dea.date=vac.date
where dea.continent is not null

Select *, (RollingPeopleVaccinated/population)*100
from #PercentPopulationVaccinated;

--Creating a view
DROP VIEW IF EXISTS PercentPopulationVaccinated;
GO
Create view PercentPopulationVaccinated as
Select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
sum(vac.new_vaccinations) Over (Partition by dea.location order by dea.date)
as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths_Clean dea
join PortfolioProject..CovidVaccinations_Clean vac
on dea.location = vac.location
and dea.date=vac.date
where dea.continent is not null

Go

Select * from PercentPopulationVaccinated;

--Highest vaccination percentage per country

SELECT location,
MAX((RollingPeopleVaccinated / population) * 100) AS MaxVaccinatedPercent
FROM PercentPopulationVaccinated
GROUP BY location
ORDER BY MaxVaccinatedPercent DESC;





