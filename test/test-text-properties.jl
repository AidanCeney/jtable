df = DataFrame(A=1:4,B = ["M", "F", "F", "M"])
dt = jtable.make_data_table(df)
@testset "set_font!_size!" begin
    jtable.set_font!_size!(dt,20)
	aTest = jtable.getAll(dt.value_matrix,"fs")
    @test all(i -> i == "40",aTest)
end

@testset "set_font!" begin
    jtable.set_font!(dt,"Times",rows = 1)
	aTest = jtable.getAll(dt.value_matrix,"font")
    @test all(i -> i == "2",aTest[1,:])
    jtable.write_table(dt,"/tmp/set_font_test.rtf")
	result          = read("/tmp/set_font_test.rtf")
	expected_result = read(project_path("test/man/set_font_test.rtf"))
    @test result == expected_result
end
@testset "set_align" begin
    jtable.set_alignment!(dt,"left")
	aTest = jtable.getAll(dt.property_matrix,"left_align")
    @test all(aTest)
    jtable.set_alignment!(dt,"right")
	aTest = jtable.getAll(dt.property_matrix,"right_align")
    @test all(aTest)
	aTest = jtable.getAll(dt.property_matrix,"left_align")
    @test all(i ->  i == false,aTest)
    jtable.set_alignment!(dt,"center")
	aTest = jtable.getAll(dt.property_matrix,"center_align")
    @test all(aTest)
	aTest = jtable.getAll(dt.property_matrix,"right_align")
    @test all(i ->  i == false,aTest)
    jtable.set_alignment!(dt,"justify")
	aTest = jtable.getAll(dt.property_matrix,"justify_align")
    @test all(aTest)
	aTest = jtable.getAll(dt.property_matrix,"center_align")
    @test all(i ->  i == false,aTest)
    jtable.set_alignment!(dt,"left")
	aTest = jtable.getAll(dt.property_matrix,"justify_align")
    @test all(i ->  i == false,aTest)
end

@testset "set_bold!" begin
    jtable.set_bold!(dt)
    aTest = jtable.getAll(dt.property_matrix,"bold")
    @test all(aTest)
end
@testset "set_italic!" begin
    jtable.set_italic!(dt)
    aTest = jtable.getAll(dt.property_matrix,"italic")
    @test all(aTest)
end

