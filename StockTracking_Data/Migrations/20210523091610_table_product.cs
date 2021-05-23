using Microsoft.EntityFrameworkCore.Migrations;

namespace StockTracking_Data.Migrations
{
    public partial class table_product : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "DescriptionIndex",
                table: "Product",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DescriptionIndex",
                table: "Product");
        }
    }
}
