<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xlink='http://www.w3.org/1999/xlink' version='1.0'>


<xsl:template match="/">
<html>
<head>
<title>
</title>
</head>
<body style="font-family:メイリオ, sans-serif; font-size:14px;">
<style>
h1{color:navy;}
th{border-style:solid; border-width:1px; border-color:gray; padding:5px; line-height:140%;color:yellow;font-weight:normal;}
td{border-style:solid; border-width:1px; border-color:gray; padding:5px; line-height:140%;}
</style>
<div style="margin-bottom:50px;">
<xsl:apply-templates select="task" mode="chara"/>
</div>
<hr/>
<div>
<xsl:apply-templates select="task" mode="words"/>
</div>
</body>
</html>
</xsl:template>




<xsl:template match="task" mode="chara">
<table border="1" width="95%">
<tr>
<th style="background-color:navy;color:lightyellow">file</th>
<th style="background-color:navy;color:lightyellow">Locked</th>
<th style="background-color:navy;color:lightyellow">Perfect Match</th>
<th style="background-color:navy;color:lightyellow">Context Match</th>
<th style="background-color:navy;color:lightyellow">Cross-file Repetitions</th>
<th style="background-color:navy;color:lightyellow">Repeated</th>
<th style="background-color:navy;color:lightyellow">100% Match</th>
<th style="background-color:navy;color:lightyellow">99-95%</th>
<th style="background-color:navy;color:lightyellow">94-85%</th>
<th style="background-color:navy;color:lightyellow">84-75%</th>
<th style="background-color:navy;color:lightyellow">74-50%</th>
<th style="background-color:navy;color:lightyellow">New</th>
<th style="background-color:navy;color:lightyellow">total (characters)</th>
</tr>
</table>
<xsl:apply-templates select="batchTotal" mode="chara"/>
<xsl:apply-templates select="file" mode="chara"/>
</xsl:template>



<!-- mode="chara" -->


<xsl:template match="batchTotal" mode="chara">
<table border="1" width="95%">
<tr>
<td style="background-color:navy;color:lightyellow">Total (characters)</td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/locked/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/perfect/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/inContextExact/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/crossFileRepeated/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/repeated/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/exact/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/fuzzy[@max='99']/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/fuzzy[@max='94']/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/fuzzy[@max='84']/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/fuzzy[@max='74']/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/new/@characters"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/total/@characters"/></td>
</tr>
</table>
</xsl:template>

<xsl:template match="file" mode="chara">
<table border="1" width="95%">
<tr>
<xsl:choose>
<xsl:when test="../taskInfo/settings/@reportLockedSegmentsSeparately='no'">
<td><xsl:value-of select="substring-before(@name,'.sdlxliff')"/></td>
<td style="background-color:silver;"><xsl:apply-templates select="analyse/locked/@characters"/></td>
<td><xsl:apply-templates select="analyse/perfect/@characters"/></td>
<td><xsl:apply-templates select="analyse/inContextExact/@characters"/></td>
<td><xsl:apply-templates select="analyse/crossFileRepeated/@characters"/></td>
<td><xsl:apply-templates select="analyse/repeated/@characters"/></td>
<td><xsl:apply-templates select="analyse/exact/@characters"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='99']/@characters"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='94']/@characters"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='84']/@characters"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='74']/@characters"/></td>
<td><xsl:apply-templates select="analyse/new/@characters"/></td>
<td><xsl:apply-templates select="analyse/total/@characters"/></td>
</xsl:when>
<xsl:otherwise>
<td><xsl:value-of select="substring-before(@name,'.sdlxliff')"/></td>
<td><xsl:apply-templates select="analyse/locked/@characters"/></td>
<td><xsl:apply-templates select="analyse/perfect/@characters"/></td>
<td><xsl:apply-templates select="analyse/inContextExact/@characters"/></td>
<td><xsl:apply-templates select="analyse/crossFileRepeated/@characters"/></td>
<td><xsl:apply-templates select="analyse/repeated/@characters"/></td>
<td><xsl:apply-templates select="analyse/exact/@characters"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='99']/@characters"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='94']/@characters"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='84']/@characters"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='74']/@characters"/></td>
<td><xsl:apply-templates select="analyse/new/@characters"/></td>
<td><xsl:apply-templates select="analyse/total/@characters"/></td>
</xsl:otherwise>
</xsl:choose>

</tr>
</table>
</xsl:template>




<!-- mode="words" -->


<xsl:template match="task" mode="words">
<table border="1" width="95%">
<tr>
<th style="background-color:navy;color:lightyellow">file</th>
<th style="background-color:navy;color:lightyellow">Locked</th>
<th style="background-color:navy;color:lightyellow">Perfect Match</th>
<th style="background-color:navy;color:lightyellow">Context Match</th>
<th style="background-color:navy;color:lightyellow">Cross-file Repetitions</th>
<th style="background-color:navy;color:lightyellow">Repeated</th>
<th style="background-color:navy;color:lightyellow">100% Match</th>
<th style="background-color:navy;color:lightyellow">99-95%</th>
<th style="background-color:navy;color:lightyellow">94-85%</th>
<th style="background-color:navy;color:lightyellow">84-75%</th>
<th style="background-color:navy;color:lightyellow">74-50%</th>
<th style="background-color:navy;color:lightyellow">New</th>
<th style="background-color:navy;color:lightyellow">total (words)</th>
</tr>
</table>
<xsl:apply-templates select="batchTotal" mode="words"/>
<xsl:apply-templates select="file" mode="words"/>
</xsl:template>


<xsl:template match="batchTotal" mode="words">
<table border="1" width="95%">
<tr>
<td style="background-color:navy;color:lightyellow">Total (words)</td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/locked/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/perfect/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/inContextExact/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/crossFileRepeated/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/repeated/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/exact/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/fuzzy[@max='99']/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/fuzzy[@max='94']/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/fuzzy[@max='84']/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/fuzzy[@max='74']/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/new/@words"/></td>
<td style="background-color:navy;color:lightyellow"><xsl:apply-templates select="analyse/total/@words"/></td>
</tr>
</table>
</xsl:template>


<xsl:template match="file" mode="words">
<table border="1" width="95%">
<tr>
<xsl:choose>
<xsl:when test="../taskInfo/settings/@reportLockedSegmentsSeparately='no'">
<td><xsl:value-of select="substring-before(@name,'.sdlxliff')"/></td>
<td style="background-color:silver;"><xsl:apply-templates select="analyse/locked/@words"/></td>
<td><xsl:apply-templates select="analyse/perfect/@words"/></td>
<td><xsl:apply-templates select="analyse/inContextExact/@words"/></td>
<td><xsl:apply-templates select="analyse/crossFileRepeated/@words"/></td>
<td><xsl:apply-templates select="analyse/repeated/@words"/></td>
<td><xsl:apply-templates select="analyse/exact/@words"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='99']/@words"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='94']/@words"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='84']/@words"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='74']/@words"/></td>
<td><xsl:apply-templates select="analyse/new/@words"/></td>
<td><xsl:apply-templates select="analyse/total/@words"/></td>
</xsl:when>
<xsl:otherwise>
<td><xsl:value-of select="substring-before(@name,'.sdlxliff')"/></td>
<td><xsl:apply-templates select="analyse/locked/@words"/></td>
<td><xsl:apply-templates select="analyse/perfect/@words"/></td>
<td><xsl:apply-templates select="analyse/inContextExact/@words"/></td>
<td><xsl:apply-templates select="analyse/crossFileRepeated/@words"/></td>
<td><xsl:apply-templates select="analyse/repeated/@words"/></td>
<td><xsl:apply-templates select="analyse/exact/@words"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='99']/@words"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='94']/@words"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='84']/@words"/></td>
<td><xsl:apply-templates select="analyse/fuzzy[@max='74']/@words"/></td>
<td><xsl:apply-templates select="analyse/new/@words"/></td>
<td><xsl:apply-templates select="analyse/total/@words"/></td>
</xsl:otherwise>
</xsl:choose>
</tr>
</table>
</xsl:template>






</xsl:stylesheet>