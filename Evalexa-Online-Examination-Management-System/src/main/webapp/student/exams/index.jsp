<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Evalexa | Available Exams</title>
    <link rel="icon" href="${pageContext.request.contextPath}/student/assets/favicon.png" type="image/png" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gradient-to-b from-purple-400 via-blue-300 to-white text-gray-900 min-h-screen flex">

    <!-- Sidebar -->
    <%@ include file="../partials/sidebar.jsp" %>

    <!-- Main Content -->
    <div class="flex-1 md:ml-60 flex flex-col min-h-screen">

        <!-- Header -->
        <%@ include file="../partials/header.jsp" %>

        <!-- Exam Table Section -->
        <main class="flex-1 p-6 overflow-hidden">
            <div class="bg-gray-100 border border-gray-400 rounded-2xl shadow-xl h-full overflow-hidden flex flex-col">
                <div class="flex justify-between items-center px-6 py-4 border-b border-gray-400">
                    <h3 class="text-lg font-semibold text-purple-600"><i class="fas fa-file-alt mr-2"></i>Available Exams</h3>
                </div>
                <div class="overflow-auto flex-1">
                    <table class="min-w-full table-auto divide-y divide-gray-700 text-sm">
                        <thead class="bg-gray-200 sticky top-0 z-10 text-purple-500">
                            <tr>
                                <th class="px-6 py-3 text-left font-semibold uppercase">ID</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Title</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Subject</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Date</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Start</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">End</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Room</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Enroll</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-700">
                            <c:forEach var="exam" items="${exams}">
                                <tr class="hover:bg-gray-200/40 transition">
                                    <td class="px-6 py-4">${exam.exam_id}</td>
                                    <td class="px-6 py-4">${exam.exam_title}</td>
                                    <td class="px-6 py-4">${exam.subject}</td>
                                    <td class="px-6 py-4">${exam.exam_date}</td>
                                    <td class="px-6 py-4">${exam.start_time}</td>
                                    <td class="px-6 py-4">${exam.end_time}</td>
                                    <td class="px-6 py-4">${exam.class_room}</td>
                                    <td class="px-6 py-4">
                                        <form action="${pageContext.request.contextPath}/student/exam" method="POST"
                                              onsubmit="return confirm('Are you sure you want to enroll in this exam?');">
                                            <input type="hidden" name="action" value="enroll" />
                                            <input type="hidden" name="exam_id" value="${exam.exam_id}" />
                                            <button type="submit"
                                                    class="inline-flex items-center px-3 py-1.5 bg-purple-600 hover:bg-purple-500 text-white text-xs font-semibold rounded-lg transition">
                                                <i class="fas fa-check-circle mr-1"></i> Enroll
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</body>
</html>