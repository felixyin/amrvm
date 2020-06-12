package com.fy.erp.modules.test

import com.fy.erp.common.utils.FileCharsetDetector
import com.fy.erp.common.utils.FileUtils
import java.io.File
import java.nio.charset.Charset

fun main(args: Array<String>) {
    val srcFolder = "/Users/fy/workspace/project/amrvm/amrvm/src/main"

    val files = FileUtils.listFiles(File(srcFolder), arrayOf("kt", ".java", "jsp", "html", "js", "css", "xml", "properties"), true)

    files.forEach {

//        val guessFileEncoding = FileCharsetDetector().guessFileEncoding(it,2)


//            println(it.name + ":" + guessFileEncoding)

            val utf8 = Charset.forName("UTF-8")
            val gbk = Charset.forName("GBK")
            val readText = it.readBytes()

            var wt = String(readText, gbk)
//        wt = String(wt.toByteArray(gbk))
            println(wt)
//        val writeText = String(readText.toByteArray(cs), Charset.forName("GBK"))
//        println(writeText)
    }


}