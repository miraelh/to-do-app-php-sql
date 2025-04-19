<?php
    echo "Hiii"; 
    
    $tasks = [
        ["id" => 1, "title" => "Buy groceries", "status" => "pending", "due" => "2024-04-15"],
        ["id" => 2, "title" => "Submit report", "status" => "done", "due" => "2024-04-10"],
        ["id" => 3, "title" => "Go jogging", "status" => "pending", "due" => "2024-04-12"],
        ["id" => 4, "title" => "Book flight", "status" => "done", "due" => "2024-04-08"]
    ];

    function filterByStatus(array $tasks, string $status): array {
        $filtered = array_filter($tasks, function($task) use ($status) {
            return $task['status'] === $status;
        });
        return $filtered;
    }
    

    function groupByStatus(array $tasks): array {
        $grouped = [];
        foreach ($tasks as $task) {
            $grouped[$task['status']][] = $task;
        }
        return $grouped;
    }

    $resultFilter = filterByStatus($tasks, "done");
    var_dump($resultFilter);


    $resultGroup = groupByStatus($tasks);
    var_dump($resultGroup);

?>
