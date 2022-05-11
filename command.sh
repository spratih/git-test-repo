import java.util.UUID
def shellCommandOutput(command) {
    def uuid = UUID.randomUUID()
    def filename = "cmd-${uuid}"
    echo filename
    sh ("${command} > ${filename}")
    def result = readFile(filename).trim()
    sh "rm ${filename}"
    return result
}

