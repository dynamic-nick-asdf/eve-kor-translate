package
{
	/* 입갤 윾동 ㅁㄴㅇㄹ 이 만듬 */

	import flash.display.MovieClip;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.events.MouseEvent;

	public class data_writer extends MovieClip
	{
		private var f: File = File.documentsDirectory.resolvePath("data/transData.asdf");
		private var fs: FileStream = new FileStream();
		private var list: Array = new Array();

		public function data_writer(): void
		{
			Object(root).korean.text = "";
			Object(root).english.text = "";

			Object(root).btn.addEventListener(MouseEvent.CLICK, faddList);
			
			freloadList();
		}
		
		private function freloadList(): void
		{
			fs.open(f, FileMode.READ);
			list = fs.readObject();
			fs.close();
			
			korList.text = "";
			engList.text = "";
			
			for(var i: int = 0; i < list.length; i++)
			{
				korList.appendText((i + 1) + ". " + list[i].kor + "\n");
				engList.appendText((i + 1) + ". " + list[i].eng + "\n");
			}
		}
		
		function faddList(e:MouseEvent): void
		{
			if(korean.text == "" || english.text == "") return void;
			
			list.push({kor: korean.text, eng: english.text});
			
			fs.open(f, FileMode.WRITE);
			fs.writeObject(list);
			fs.close();
			
			korean.text = "";
			english.text = "";
			
			freloadList();
		}
	}
}