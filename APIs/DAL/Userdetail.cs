using System;
using System.Configuration;
using System.IO;
using System.Security.Cryptography;
using System.Text;


namespace APIs.Model
{
    public static class Userdetail
    {
        public static User Userdetails { get; set; }

        public static string Decrypt(string message)
        {
            byte[] encryptedPass= Encoding.Unicode.GetBytes(message);
            var key = ConfigurationManager.AppSettings["Key"];
            var IV = ConfigurationManager.AppSettings["IV"];
            var keybytes = Encoding.UTF8.GetBytes(key);
            var IVbytes = Encoding.UTF8.GetBytes(IV);           
            var encrypted = Convert.FromBase64String(message);
            var password = DecryptStringFromBytes(encrypted, keybytes, IVbytes);
            return password;
        }
     
        private static string DecryptStringFromBytes(byte[] cipherText, byte[] key, byte[] iv)
        {
            // Check arguments.
            if (cipherText == null || cipherText.Length <= 0)
            {
                throw new ArgumentNullException("cipherText");
            }
            if (key == null || key.Length <= 0)
            {
                throw new ArgumentNullException("key");
            }
            if (iv == null || iv.Length <= 0)
            {
                throw new ArgumentNullException("key");
            }

            
            string plaintext = null;

            
            using (var rijAlg = new RijndaelManaged())
            {
            
                rijAlg.Mode = CipherMode.CBC;
                rijAlg.Padding = PaddingMode.PKCS7;
                rijAlg.FeedbackSize = 128;

                rijAlg.Key = key;
                rijAlg.IV = iv;
                var decryptor = rijAlg.CreateDecryptor(rijAlg.Key, rijAlg.IV);

                using (var msDecrypt = new MemoryStream(cipherText))
                {
                    using (var csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (var srDecrypt = new StreamReader(csDecrypt))
                        {
                            plaintext = srDecrypt.ReadToEnd();
                        }
                    }
                }
            }

            return plaintext;
        }
    }
}