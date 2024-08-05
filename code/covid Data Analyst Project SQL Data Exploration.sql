---looking at total cases vs total deaths
--shows likelihood of dying if you contract covid on your country
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as deathpourcentage
from [portofolio project]..CovidDeaths
where location like 'morocco'
order by 1,2

-- loking at total cases vs population
-- shows what percentage of population got covid
select location,date,population,total_cases,(total_cases/population)*100 as pourcentage_of_patient
from [portofolio project]..CovidDeaths
--where location like 'morocco'
order by 1,2

--- looking at countries with highest infection rate comparet to population
select location,population,max(total_cases) as HeighestInfectionCount,max((total_cases/population)*100) as pourcentage_of_population_effected
from [portofolio project]..CovidDeaths
group by  location,population
order by pourcentage_of_population_effected desc



--Showing the countries with the heighest deathcount per population
select location,max(cast(total_deaths as int)) as totalDeathsCount
from [portofolio project]..CovidDeaths
group by  location
order by totalDeathsCount desc


-- let's break things down by continent
select continent,max(cast(total_deaths as int)) as totalDeathsCount
from [portofolio project]..CovidDeaths
where continent is not null
group by  continent
order by totalDeathsCount desc


--showing the continents with the heighest death count per population
select continent,max(cast(total_deaths as int)/population) as totalDeathsCountperPopulation
from [portofolio project]..CovidDeaths
where continent is not null
group by  continent
order by totalDeathsCount desc


--GLOBAL NUMBERS

 select date,sum(new_cases) as TotalCases,sum(cast(new_deaths as int)) as TotalDeaths,(sum(cast(new_deaths as int))/sum(new_cases))*100 as DeathPourcentage
from [portofolio project]..CovidDeaths
where continent is not null
group by date
order by 1,2


-- looking at total population vs vaccination

select dea.continent,dea.location,dea.population,dea.date,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as
RollingPeopleacinated
from [portofolio project]..CovidDeaths dea
join 
 [portofolio project]..CovidVaccinations vac
 on dea.location=vac.location
   and dea.date=vac.date
   where dea.continent is not null
   order by 2



   --use cte

   with PopvsVac (continent,location,population,date,new_vaccinations,RollingPeopleacinated)
   as
   (
   select dea.continent,dea.location,dea.population,dea.date,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as
RollingPeopleacinated
from [portofolio project]..CovidDeaths dea
join 
 [portofolio project]..CovidVaccinations vac
 on dea.location=vac.location
   and dea.date=vac.date
   where dea.continent is not null
   )
   select *,(RollingPeopleacinated/population)*100
   from PopvsVac




  --temp table
  drop table if exist #PercentPopulationVaccinated 
  create table #PercentPopulationVaccinated(
  continent nvarchar(255),
  location nvarchar(255),
   population numeric,
   Date datetime,
  new_vaccinatin numeric,
  rollingpeoplevaccinated numeric,
  )
  insert into #PercentPopulationVaccinated
  select dea.continent,dea.location,dea.population,dea.date,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as
RollingPeopleacinated
from [portofolio project]..CovidDeaths dea
join 
 [portofolio project]..CovidVaccinations vac
 on dea.location=vac.location
   and dea.date=vac.date
   where dea.continent is not null

    select *,( rollingpeoplevaccinated/population)*100
   from  #PercentPopulationVaccinated



-- creating view to store data for later visualisations
create view percentpopulationvaccinated
as
  select dea.continent,dea.location,dea.population,dea.date,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as
RollingPeopleacinated
from [portofolio project]..CovidDeaths dea
join 
 [portofolio project]..CovidVaccinations vac
 on dea.location=vac.location
   and dea.date=vac.date
   where dea.continent is not null
    