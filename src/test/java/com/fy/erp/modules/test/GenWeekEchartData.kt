package com.fy.erp.modules.test

import org.apache.commons.lang3.RandomUtils

fun main(args: Array<String>) {


    (1..56)
            .map { "\"第${it}周\"," }
            .forEach { println(it) }

    println("=========================================================")


    (1..56).map { RandomUtils.nextInt(300, 2000).toString() + "," }
            .forEach(::println)

}