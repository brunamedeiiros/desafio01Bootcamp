/**
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: 
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
**/
select sum(e.salario) from public.empregado as e
join public.departamento as d on d.dnumero = e.dno
where d.dnome = 'Research';

select sum(e.salario) from public.empregado as e
join public.departamento as d on d.dnumero = e.dno
where d.dnumero = 5;


/**
Considere o banco de dados do enunciado. Crie uma consulta em 
SQL e responda: Qual a média salarial nessa empresa?
**/

select avg(e.salario) from public.empregado as e;

/**
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
**/

select e.pnome as nome_empregado, e.ssn, d.nome_dependente from public.empregado e
left join public.dependente d on d.essn = e.ssn;

select count(1) from public.empregado;

/**
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
**/

select e.ssn emp_id, e.superssn as supervisor_id,
 e.pnome empregado_nome, s.ssn id_supervisor_real, s.pnome as nome_supervisor, s.unome as unome_supervisor
 from public.empregado e
left join public.empregado s on s.ssn = e.superssn
where s.pnome = 'Franklin' ;


/**
Considere o banco de dados do enunciado.
 Crie uma consulta em SQL e responda: Qual seria o custo do projeto com folha salarial (soma de todos os salários), 
 caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
**/

select  e.* from public.empregado e
join public.trabalha_em t on t.essn = e.ssn
join public.projeto p on p.pnumero = t.pno
where p.pjnome = 'ProductX';


/**
Considere o banco de dados do enunciado.
 Crie uma consulta em SQL e responda: Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
**/

select e.ssn, e.pnome, t.horas from public.empregado e
join public.trabalha_em t on t.essn = e.ssn
join public.projeto p on p.pnumero = t.pno
join public.departamento d on d.dnumero = e.dno
where p.pjnome = 'ProductX' and d.dnumero = 5;

/**
Considere o banco de dados do enunciado.
 Crie uma consulta em SQL e responda: Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
**/

select * from public.empregado e
join public.trabalha_em t on t.essn = e.ssn
join public.projeto p on p.pnumero = t.pno
join public.departamento d on d.dnumero = e.dno
where p.pjnome = 'Newbenefits';


/** 
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Qual o nome do departamento com a menor média de salário entre seus funcionários?
**/

select d.dnome, avg(e.salario) from public.empregado e
join public.trabalha_em t on t.essn = e.ssn
join public.departamento d on d.dnumero = e.dno
group by d.dnome
