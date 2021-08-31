<%-- 
    Document   : calendario
    Created on : 30 de ago. de 2021, 20:31:04
    Author     : EkerSteve
--%>

<%-- 
    Document   : calendario
    Created on : 30 de ago. de 2021, 20:31:04
    Author     : EkerSteve
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.time.YearMonth"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% 
            try {
                Integer year = Integer.parseInt(request.getParameter("year"));
                Integer month = Integer.parseInt(request.getParameter("month"));
                out.print("<title>Caléndario "+year+"</title>"); 
                out.print("<link rel='shortcut icon' href='https://iconarchive.com/download/i107325/google/noto-emoji-animals-nature/22214-dog-face.ico' />");
            } catch(Exception e) {
                out.print("<title>Ocorreu um erro</title>"); 
                out.print("<link rel='shortcut icon' href='https://download1334.mediafire.com/8waqmxcf79ug/vg239kh46gp438g/favicon.ico' />");
            }
        %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <style>
            * {
                font-family: Roboto, Arial, sans-serif;
            }
            *:active, *:focus {
                outline: none;
            }
            .width-default {
                width: 40px;
            }
        </style>
    </head>
    <body class="flex flex-col items-center justify-center min-h-screen gap-4">
        <div class="flex flex-col items-center justify-center text-center w-full gap-6" style="max-width: 600px">
            <% 
                try {
                    Integer year = Integer.parseInt(request.getParameter("year"));
                    Integer month = Integer.parseInt(request.getParameter("month"));
                    Integer days = YearMonth.of(year,month).atEndOfMonth().getDayOfMonth();
                    Integer firstWeek = YearMonth.of(year, month).atDay(1).getDayOfWeek().getValue();
                    boolean isFirstDay = true;
                    List<String> monthNames = 
                           Arrays.asList("Janeiro", "Fevereiro", "Março",
                                   "Abril","Maio" ,"Junho", "Julho", "Agosto",
                                   "Setembro", "Outubro", "Novembro", "Dezembro");
                    out.print("<h1 class='text-blue-600 font-extrabold text-6xl'>"+year+"</h1>");
                    out.print("<h2 class='text-blue-600 font-bold text-xl'>"+monthNames.get(month-1)+"</h2>");
                    out.print("<div class='flex flex-col gap-2'>");
                        out.print("<div class='flex gap-1 text-blue-700'>");
                            out.print("<div class='width-default'>Seg</div>");
                            out.print("<div class='width-default'>Ter</div>");
                            out.print("<div class='width-default'>Qua</div>");
                            out.print("<div class='width-default'>Qui</div>");
                            out.print("<div class='width-default'>Sex</div>");
                            out.print("<div class='width-default'>Sab</div>");
                            out.print("<div class='width-default'>Dom</div>");
                        out.print("</div>");
                        Integer day = 1;
                        while(day <= days){
                            out.print("<div class='flex gap-1 text-blue-700'>");
                                Integer weeks = 1;
                                for(; weeks <= 7; weeks++){
                                    if(isFirstDay){
                                        if(weeks == firstWeek) {
                                            isFirstDay = false;
                                            out.print("<div class='text-center width-default'>"+day+"</div>");
                                            day++;
                                            continue;
                                        }
                                        out.print("<div class='width-default'></div>");
                                        continue;
                                    }
                                    if(day > days) {
                                        out.print("<div class='width-default'></div>");
                                        continue;
                                    }
                                    out.print("<div class='text-center width-default'>"+day+"</div>");
                                    day++;
                                }
                            out.print("</div>");
                        }
                    out.print("</div>");
                    out.print("<div class='flex w-full flex-row justify-around'>");
                        if((month + 1) > 12){
                            out.print("<a href='calendario.jsp?year="+year+"&month="+(month-1)+"' class='text-sm text-blue-700 cursor-pointer'><b> < </b> Mês anterior</a>");
                            out.print("<a href='calendario.jsp?year="+(year+1)+"&month=1' class='text-sm text-blue-700 cursor-pointer'>Próximo mês <b> > </b></a>");
                        } else if ((month - 1) < 1) {
                            out.print("<a href='calendario.jsp?year="+(year-1)+"&month=12' class='text-sm text-blue-700 cursor-pointer'><b> < </b> Mês anterior</a>");
                            out.print("<a href='calendario.jsp?year="+year+"&month="+(month+1)+"' class='text-sm text-blue-700 cursor-pointer'>Próximo mês> <b> > </b></a>");
                        } else {
                            out.print("<a href='calendario.jsp?year="+year+"&month="+(month-1)+"' class='text-sm text-blue-700 cursor-pointer'><b> < </b> Mês anterior</a>");
                            out.print("<a href='calendario.jsp?year="+year+"&month="+(month+1)+"' class='text-sm text-blue-700 cursor-pointer'>Próximo mês <b> > </b></a>");
                        }
                    out.print("</div>");
                    out.print("<div class='flex w-full flex-row justify-around'>");
                        out.print("<a href='calendario.jsp?year="+(year-1)+"&month="+month+"' class='text-sm text-blue-700 cursor-pointer'><b> < </b> Ano anterior</a>");
                        out.print("<a href='calendario.jsp?year="+(year+1)+"&month="+month+"' class='text-sm text-blue-700 cursor-pointer'>Próximo ano <b> > </b></a>");
                    out.print("</div>");
                } catch (Exception e) {
                       out.print("<p class='text-red-500'>Ocorreu um erro, volte ao ínicio e tente novamente.</p>");
                }
            %>
            <a class="cursor-pointer underline text-blue-600" href="index.html">Voltar para o menu inicial.</a>
        </div>
    </body>
</html>
