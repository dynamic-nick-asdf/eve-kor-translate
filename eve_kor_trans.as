package
{
	/* 입갤 윾동 ㅁㄴㅇㄹ 이 만듬 */

	import flash.display.MovieClip;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.utils.ByteArray;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;


	public class eve_kor_trans extends MovieClip
	{
		private var _f: File = File.documentsDirectory.resolvePath("data/transData.asdf");
		private var _fs: FileStream = new FileStream();
		private var _data: Array = new Array();
		private var _act: Boolean = false;


		public function eve_kor_trans(): void
		{
			trans.addEventListener(MouseEvent.CLICK, _ftrans);

			readDb();
		}

		public function readDb(): void
		{
			_fs.open(_f, FileMode.READ);
			
			_data = _fs.readObject();
			
			_fs.close();
		}

		public function _ftrans(e: MouseEvent): void
		{
			var str:String;
			
			str = String(Clipboard.generalClipboard.getData(ClipboardFormats.TEXT_FORMAT));
			
			for(var i: int = 0; i < _data.length; i++)
			{
				str = str.replace(new RegExp(_data[i].kor, "g"), _data[i].eng);
			}
			
			Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, str);
		}
	}

}