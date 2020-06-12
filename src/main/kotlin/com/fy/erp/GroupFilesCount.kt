package com.fy.erp

import java.io.File

fun main(args: Array<String>) {

    File("C:\\Users\\Administrator\\Desktop\\theme-master\\backend").walk().maxDepth(1)
            .filter { it.isDirectory }
//            .filter { it.extension == "html" }
            .map { val size = it.listFiles().size; Pair(it.name, size) }.sortedBy { it.second }
            .forEach { println(it) }

}